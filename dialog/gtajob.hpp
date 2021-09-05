// missionConfigfile >> "life_gtajob_dialog"


class gtaJobRscBackground: RscPicture {
	x = 0.29375 * safezoneW + safezoneX;
	text = "#(argb,8,8,3)color(0.11,0.11,0.11,1)";
};

class gtaJobRscText: RscText {
	x = 0.29375 * safezoneW + safezoneX;
	w = 0.4125 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.11,0.11,0.11,1};
};

class gtaJobRscButton: RscButton {
	onLoad = "_this select 0 ctrlEnable false;"; // Disable the button by default
	x = 0.37625 * safezoneW + safezoneX;
	w = 0.2475 * safezoneW;
	h = 0.044 * safezoneH;
	colorBackground[] = {0.45, 0.45, 0.45 ,1};
	colorFocused[] = {0.45, 0.45, 0.45, 1};
	colorBackgroundActive[] = {0.3, 0.3, 0.3, 1};
};

class life_gtajob_dialog {
	idd = 1212;
	movingEnabled = false;

	class controls {

		// Backgrounds
		class background1: gtaJobRscBackground {
			y = 0.445 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.286 * safezoneH;
		};

		class background2: gtaJobRscBackground {
			y = 0.753 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class background3: gtaJobRscBackground {
			y = 0.379 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class background4: gtaJobRscBackground {
			y = 0.269 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
		};

		// Texts
		class textHeader: gtaJobRscText {
			text = "                                          GTA Jobs"; 
			y = 0.225 * safezoneH + safezoneY;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.05,0.4,0.2,1};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2)";
		};

		class textExp: gtaJobRscText {
			idc = 1300;
			text = "Level 0: 0/0exp";
			y = 0.401 * safezoneH + safezoneY;
		};

		class textCooldown: gtaJobRscText {
			idc = 1301;
			text = "Cooldown: 0min";
			y = 0.423 * safezoneH + safezoneY;
		};

		class text1: gtaJobRscText {
			text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "; 
			y = 0.291 * safezoneH + safezoneY;
		};

		class text2: gtaJobRscText {
			text = "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"; 
			y = 0.313 * safezoneH + safezoneY;
		};

		class text3: gtaJobRscText {
			text = "when an unknown printer took a galley of type and scrambled it to make a type specimen book."; 
			y = 0.335 * safezoneH + safezoneY;
		};

		class text4: gtaJobRscText {
			text = "when an unknown printer took a galley of type and scrambled it to make a type specimen book."; 
			y = 0.357 * safezoneH + safezoneY;
		};

		class textBottom: gtaJobRscText {
			text = "                                                                      Click the difficulty to start the mission"; 
			y = 0.731 * safezoneH + safezoneY;
		};

		// Buttons
		class Button1: gtaJobRscButton {
			idc = 1600;
			text = "Easy"; 
			y = 0.467 * safezoneH + safezoneY;
			tooltip = "Level 0\nRisk: Low, possible car alarm, requires 3 cops awake\nCost: $5,000, Payout: $20,000-$40,000, Exp: 200\nClick to start";
			action = "['easy'] spawn life_fnc_gtaJobStart";
		};

		class Button2: gtaJobRscButton {
			idc = 1601;
			text = "Medium"; 
			y = 0.533 * safezoneH + safezoneY;
			tooltip = "Level 5\nRisk: Medium, car alarm, requires 6 cops awake\nCost: $10,000, Payout: $40,000-$60,000, Exp: 300\nClick to start";
			action = "['medium'] spawn life_fnc_gtaJobStart";
		};

		class Button3: gtaJobRscButton {
			idc = 1602;
			text = "Hard"; 
			y = 0.599 * safezoneH + safezoneY;
			tooltip = "Level 10\nRisk: High, car alarm, possible tracker, requires 10 cops awake and no active major\nCost: $20,000, Payout: $80,000-$120,000, Exp: 500\nClick to start";
			action = "['hard'] spawn life_fnc_gtaJobStart";
		};

		class Button4: gtaJobRscButton {
			idc = 1603;
			text = "Very Hard"; 
			y = 0.665 * safezoneH + safezoneY;
			tooltip = "Level 15\nRisk: Very High, car alarm, tracker, requires 15 cops awake and no active major\nCost: $30,000, Payout: $120,000-$160,000, Exp: 750\nClick to start";
			action = "['veryhard'] spawn life_fnc_gtaJobStart";
		};

	};
};
