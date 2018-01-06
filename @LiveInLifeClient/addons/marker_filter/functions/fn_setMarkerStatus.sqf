
params [
	"_markers",
	"_status"
];

{
	_x setMarkerAlphaLocal _status;
} forEach _markers;
