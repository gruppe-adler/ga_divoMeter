//Originally created Carl Gustaffa
//Edited for Diver Stats by trin scourge
//Edited for Diver Mod by Salbei


class slb_disp {
	idd = 1109;
	name=_slb;
	onLoad = "uiNamespace setVariable ['disp', _this select 0]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	controlsBackground[] = {};
	objects[] = {};
	 class controls {
		class slb_image {
			idc = 1110;
			type = CT_STATIC;
			style = ST_PICTURE;
			colorBackground[] = { };
			colorText[] = { };
			font = puristaLight;
			sizeEx = 0.053;
			x = safeZoneX+(safeZoneW*0.755);
			y = safeZoneY+(safeZoneH*0.32);
			w = safeZoneW* 0.32;
			h = safeZoneH* 0.48;
			text = "\images\divingWatch.paa";
		};
		class slb_ascTime: RscText {
			idc = 1111;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,1};
			sizeEx = 0.035 * safezoneH;
			x = safeZoneX+(safeZoneW*0.376);
			y = safeZoneY-(safeZoneH*0.0);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_diveDepth: RscText {
			idc = 1112;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,1};
			sizeEx = 0.035 * safezoneH;
			x = safeZoneX+(safeZoneW*0.376);
			y = safeZoneY+(safeZoneH*0.05);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_diveTime: RscText {
			idc = 1113;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,0.8};
			sizeEx = 0.023 * safezoneH;
			x = safeZoneX+(safeZoneW*0.366);
			y = safeZoneY+(safeZoneH*0.102);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_maxDepth: RscText {
			idc = 1114;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.9};
			sizeEx = 0.017 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.444);
			y = safeZoneY+(safeZoneH*0.1034);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_timeLeft: RscText {
			idc = 1115;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,1};
			sizeEx = 0.035 * safezoneH;
			x = safeZoneX+(safeZoneW*0.448);
			y = safeZoneY-(safeZoneH*0.0);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_pressure: RscText {
			idc = 1116;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,0.8};
			sizeEx = 0.020 * safezoneH;
			x = safeZoneX+(safeZoneW*0.460);
			y = safeZoneY+(safeZoneH*0.07);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_acr: RscText {
			idc = 1117;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,0.8};
			sizeEx = 0.020 * safezoneH;
			x = safeZoneX+(safeZoneW*0.460);
			y = safeZoneY+(safeZoneH*0.052);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_psi: RscText {
			idc = 1118;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,1};
			sizeEx = 0.035 * safezoneH;
			x = safeZoneX+(safeZoneW*0.43);
			y = safeZoneY+(safeZoneH*0.059);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_upArrow: RscPicture {
			idc = 1119;
			colorText[] = { };
			font = puristaLight;
			sizeEx = 0.053;
			x = safeZoneX+(safeZoneW*0.6785);
			y = safeZoneY+(safeZoneH*0.29);
			w = safeZoneW* 0.48;
			h = safeZoneH* 0.6;
			text = "";
		};
		class slb_downArrow: RscPicture {
			idc = 1123;
			colorText[] = { };
			font = puristaLight;
			sizeEx = 0.053;
			x = safeZoneX+(safeZoneW*0.669);
			y = safeZoneY+(safeZoneH*0.29);
			w = safeZoneW* 0.5;
			h = safeZoneH* 0.6;
			text = "";
		};
		class slb_arrowUpDepth: RscText {
			idc = 1120;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,0.6};
			sizeEx = 0.020 * safezoneH;
			x = safeZoneX+(safeZoneW*0.385);
			y = safeZoneY+(safeZoneH*0.068);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_UpDepth: RscText {
			idc = 1121;
			text = "";
			font = puristaLight;
			colorText[] = {0,0,0,0.6};
			sizeEx = 0.023 * safezoneH;
			x = safeZoneX+(safeZoneW*0.397);
			y = safeZoneY+(safeZoneH*0.065);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_N2Amt: RscText {
			idc = 1122;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.9};
			sizeEx = 0.018 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.399);
			y = safeZoneY+(safeZoneH*0.105);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_tisSat: RscPicture {
			idc = 1124;
			colorText[] = { };
			font = puristaLight;
			sizeEx = 0.053;
			x = safeZoneX+(safeZoneW*0.7325);
			y = safeZoneY+(safeZoneH*0.314);
			w = safeZoneW* 0.40;
			h = safeZoneH* 0.5;
			text = "";
		};
		class slb_warnTxt: RscText {
			idc = 1125;
			text = "";
			font = puristaMedium;
			colorText[] = {1,1,1,1};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.373);
			y = safeZoneY+(safeZoneH*0.121);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_bearingTxt: RscText {
			idc = 1126;
			text = "";
			font = puristaMedium;
			colorText[] = {1,1,1,1};
			sizeEx = 0.018 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.449);
			y = safeZoneY+(safeZoneH*0.120);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_tempTxt: RscText {
			idc = 1127;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.8};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.378);
			y = safeZoneY-(safeZoneH*0.033);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_gridTxt: RscText {
			idc = 1128;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.8};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.45);
			y = safeZoneY-(safeZoneH*0.034);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_decostopTxt: RscText {
			idc = 1129;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.8};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.44);
			y = safeZoneY-(safeZoneH*0.0185);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_decotimeTxt: RscText {
			idc = 1130;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.8};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.465);
			y = safeZoneY-(safeZoneH*0.0185);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_deepstopTxt: RscText {
			idc = 1131;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.8};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.44);
			y = safeZoneY+(safeZoneH*0.032);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_deeptimeTxt: RscText {
			idc = 1132;
			text = "";
			font = puristaLight;
			colorText[] = {1,1,1,0.8};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.465);
			y = safeZoneY+(safeZoneH*0.032);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_MODTxt: RscText {
			idc = 1133;
			text = "";
			font = puristaMedium;
			colorText[] = {1,1,1,1};
			sizeEx = 0.016 * safezoneH;
			shadow = 0.5;
			x = safeZoneX+(safeZoneW*0.373);
			y = safeZoneY+(safeZoneH*0.121);
			w = safeZoneW* 1;
			h = safeZoneH* 1;
		};
		class slb_ppO: Box {
			idc = 1134;
			text = "";
			font = puristaMedium;
			colorBackground[] = {0,1,0,0.5};
			colorText[] = {};			
			x = safeZoneX+(safeZoneW*0.845);
			y = safeZoneY+(safeZoneH*0.645);
			w = safeZoneW* 0.0001;
			h = safeZoneH* 0.005;
		};
		class slb_ppHe: Box {
			idc = 1135;
			text = "";
			font = puristaMedium;
			colorBackground[] = {0,1,0,0.5};
			colorText[] = {};			
			x = safeZoneX+(safeZoneW*0.9178);
			y = safeZoneY+(safeZoneH*0.645);
			w = safeZoneW* 0.0001;
			h = safeZoneH* 0.005;
		};
		class slb_n2lvl: Box {
			idc = 1136;
			text = "";
			font = puristaMedium;
			colorBackground[] = {0,1,0,1};
			colorText[] = {};			
			x = safeZoneX+(safeZoneW*0.8455);
			y = safeZoneY+(safeZoneH*0.46);
			w = safeZoneW* 0.005;
			h = safeZoneH* 0.0001;
		};
		
	};
};
