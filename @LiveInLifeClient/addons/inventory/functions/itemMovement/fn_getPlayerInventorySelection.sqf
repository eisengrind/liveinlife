
//-1 - none, 0 - uniform, 1 - vest, 2 - backpack
try {
    if (isNull (findDisplay 602)) throw -1;
    //633 - uniform, 638 - vest, 619 - backpack

    if ((lbCurSel 633) > -1) throw 0;
    if ((lbCurSel 638) > -1) throw 1;
    if ((lbCurSel 619) > -1) throw 2;
    
    throw -1;
} catch {
    _exception;
};
