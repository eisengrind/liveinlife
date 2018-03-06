
lils_login_set_defPackages append [
    "set_lil_job_agent_activeTasks",
    "set_lil_job_agent_stage"
];

["set_lil_job_agent_activeTasks", {
    _dbCol = ["job_agent_activeTasks", true, true];
}] call lils_login_fnc_addPackage;

["set_lil_job_agent_stage", {
    _dbCol = ["job_agent_stage", true, false];
}] call lils_login_fnc_addPackage;

["update_lil_job_agent_activeTasks", {
    [
        "job_agent_activeTasks",
        [(_this select 1)] call lils_common_fnc_arrayEncode
    ];
}] call lils_login_fnc_addPackage;

["update_lil_job_agent_stage", {
    [
        "job_agent_stage",
        [(_this select 1)] call lils_common_fnc_arrayEncode
    ];
}] call lils_login_fnc_addPackage;
