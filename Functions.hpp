
class Life_Client_Core {
    tag = "life";

	class GTAJob {
        file = "core\gtajob";
        class gtaJobSpawn {};
		class gtaJobLockpickAction {};
		class gtaJobStartTracker {};
		class gtaJobRemoveTrackerAction {};
		class gtaJobCreateStolenCarMarker {};
		class gtaJobCreateTrackerMarker {};
		class gtaJobDropoffAction {};
	};

	class Events {
        file = "core\events";
        class keyHandler {};
	};

	class Dialog_Controls {
        file = "dialog\function";
        class gtaJobDialog {};
		class gtaJobStart {};
    };

};