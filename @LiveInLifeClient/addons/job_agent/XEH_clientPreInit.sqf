
lilc_job_agent_activeTasks = [];
lilc_job_agent_stage = 0;

lilc_login_update_defPackages append [
    "update_lil_job_agent_activeTasks",
    "update_lil_job_agent_stage"
];

[
    "update_lil_job_agent_activeTasks",
    {
        lilc_job_agent_activeTasks;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_job_agent_stage",
    {
        lilc_job_agent_stage;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_job_agent_activeTasks",
    {
        lilc_job_agent_activeTasks = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_job_agent_stage",
    {
        lilc_job_agent_stage = _this;
    }
] call lilc_login_fnc_addPackage;

