
class GTAJobs {

	class general {
		cooldown = 3; // Minutes // TODO 30
	};

	class easy {
		condition = "{(side _x) == WEST} count allPlayers > 0"; //TODO 3
		levelReq = 0;
		carAlarmChance = 60;
		trackerChance = 0;
		cost = 5000; // TODO
		rewardMin = 20000;
		rewardMax = 40000;
		expReward = 200;
		vehicles[] = {"C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F"};
	};

	class medium {
		condition = "{(side _x) == WEST} count allPlayers > 0"; //TODO 6
		levelReq = 5;
		carAlarmChance = 100;
		trackerChance = 0;
		cost = 10000;
		rewardMin = 40000;
		rewardMax = 60000;
		expReward = 300;
		vehicles[] = {"C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F"};
	};

	class hard {
		condition = "{(side _x) == WEST} count allPlayers > 0"; //TODO 10
		levelReq = 10;
		carAlarmChance = 100;
		trackerChance = 50;
		cost = 20000;
		rewardMin = 80000;
		rewardMax = 120000;
		expReward = 500;
		vehicles[] = {"C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F"};
	};

	class veryhard {
		condition = "{(side _x) == WEST} count allPlayers > 0"; //TODO 15
		levelReq = 15;
		carAlarmChance = 100;
		trackerChance = 100;
		cost = 30000;
		rewardMin = 120000;
		rewardMax = 160000;
		expReward = 750;
		vehicles[] = {"C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F"};
	};

};