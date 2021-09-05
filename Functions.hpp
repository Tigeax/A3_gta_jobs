
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
        class gtaJobRemoveTrackerActionAdd {};
        class gtaJobRemoveTrackerActionRemove {};
        class gtaJobDropoffVehicleActionAdd {};
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

	class Network {
        file = "core\functions\network";
        class say3D {};
    };

};