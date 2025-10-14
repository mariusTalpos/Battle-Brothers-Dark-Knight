this.legends_dark_knight_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_dark_knight";
		this.m.Name = "Dark Knight";
		this.m.Description = "[p=c][img]gfx/ui/events/event_35.png[/img][/p][p]The evils of this world are ruthless and brutal. You will be worse.\n\n[color=#bcad8c]Lone Wolf:[/color] Start with as a fledgeling dark knight and great equipment, but low funds.\n[color=#bcad8c]Dark Missionary:[/color] Start with a small roster size but gain the ability to recruit other dark knights.\n[color=#bcad8c]Avatar:[/color] If your dark knight dies, the campaign ends.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 110;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(3);
		this.m.StartingBusinessReputation = 100;
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.m.StartingBusinessReputation));
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local bro;
		bro = roster.create("scripts/entity/tactical/player");
		bro.setStartValuesEx([
			"legend_dark_knight_background"
		]); //skills on start
		::Legends.Traits.grant(bro, ::Legends.Trait.Player);
		::Legends.Traits.remove(bro, ::Legends.Trait.Loyal);
		// this.addScenarioPerk(bro.getBackground(), this.Const.Perks.PerkDefs.FortifiedMind); TODO: maybe add later
		bro.m.PerkPointsSpent += 3;
		bro.setPlaceInFormation(4);
		bro.setVeteranPerks(2);
		bro.getFlags().set("IsPlayerCharacter", true);
 		bro.getSprite("socket").setBrush("bust_base_crusader"); //custom base
		bro.getSprite("miniboss").setBrush("bust_miniboss_crusader"); //custom bust
		bro.m.HireTime = this.Time.getVirtualTimeF();
		this.World.Assets.addMoralReputation(0);
		this.World.Assets.addBusinessReputation(this.m.StartingBusinessReputation);
		this.World.Assets.m.Ammo = 0;

		local stash = this.World.Assets.getStash();
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/armor_parts_item"));
		stash.add(this.new("scripts/items/weapons/test_stick"))
		stash.add(this.new("scripts/items/supplies/medicine_item"));
		stash.add(this.new("scripts/items/supplies/cured_venison_item"));
	}

	function onSpawnPlayer() //spawn location
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 1), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 1));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 1), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 1));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) == 0)
				{
				}
				else if (!tile.HasRoad)
				{
				}
				else
				{
					randomVillageTile = tile;
					break;
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(102);
		//this.World.State.m.Player.getSprite("body").setBrush("figure_player_crusader");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/noble_02.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_dark_knight_scenario_intro");
		}, null);

	}

	function onInit() //starting slots
	{
		this.starting_scenario.onInit();
		// this.World.Flags.set("IsLegendsCrusader", true);
	}

	function onCombatFinished() //is crusader kill?
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}

	function onHiredByScenario( bro )
	{
	// 	if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Crusader))
	// 	{
	// 		bro.improveMood(1.5, "Joined a righteous cause");
 	// 		bro.getSprite("socket").setBrush("bust_base_crusader"); //custom base
	// 	}
	// 	else
	// 	{
	// 		bro.worsenMood(2.0, "Dislikes your sermons");
	// 	}
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		// this.addBroToRoster(_roster, "apostate_background", 4);
		// this.addBroToRoster(_roster, "wretch_background", 4);
		this.addBroToRoster(_roster, "dark_knight_background", 8);

		foreach( i, bro in bros )
		{

			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Crusader)) // the holy ones will not join you
			{
				garbage.push(bro);
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onGenerateBro(bro)
	{

	}

	function onBuildPerkTree( _background )
	{
		// TODO: define our own scenario perk
		// this.addScenarioPerk(_background, this.Const.Perks.PerkDefs.FortifiedMind, 2, _background.isBackgroundType(this.Const.BackgroundType.Crusader));
	}


});

