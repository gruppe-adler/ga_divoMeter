class CfgVehicles
{
    class Items_base_F;
    class GA_Lift_Bag : Items_base_F
    {
        scope = 2;
        model = QPATHTOF(data\models\liftballon.p3d);
        displayName = "Lift Bag";
        vehicleClass = "small_items";

        slingLoadCargoMemoryPoints[] =
        {
            "SlingLoadCargo1",
            "SlingLoadCargo2",
            "SlingLoadCargo3",
            "SlingLoadCargo4"
        };
    };
};
