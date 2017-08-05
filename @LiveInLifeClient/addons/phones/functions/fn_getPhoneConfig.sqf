
params [
    ["_phoneType", "", [""]]
];

try
{
    throw (missionConfigFile >> "CfgPhones" >> _phoneType);
}
catch
{
    _exception;
};
