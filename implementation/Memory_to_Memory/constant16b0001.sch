<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="V" />
        <signal name="G" />
        <signal name="O(15:0)" />
        <signal name="G,G,G,G,G,G,G,V,G,G,G,G,G,G,G,G" />
        <port polarity="Output" name="O(15:0)" />
        <blockdef name="buf16">
            <timestamp>2010-10-10T23:31:36</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="vcc" name="XLXI_2">
            <blockpin signalname="V" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_3">
            <blockpin signalname="G" name="G" />
        </block>
        <block symbolname="buf16" name="XLXI_1">
            <blockpin signalname="G,G,G,G,G,G,G,V,G,G,G,G,G,G,G,G" name="I(15:0)" />
            <blockpin signalname="O(15:0)" name="O(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="1760" height="1360">
        <instance x="96" y="224" name="XLXI_2" orien="R0" />
        <branch name="V">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="240" y="240" type="branch" />
            <wire x2="160" y1="224" y2="240" x1="160" />
            <wire x2="240" y1="240" y2="240" x1="160" />
        </branch>
        <instance x="96" y="544" name="XLXI_3" orien="R0" />
        <branch name="G">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="240" y="400" type="branch" />
            <wire x2="240" y1="400" y2="400" x1="160" />
            <wire x2="160" y1="400" y2="416" x1="160" />
        </branch>
        <branch name="O(15:0)">
            <wire x2="1440" y1="320" y2="320" x1="1280" />
        </branch>
        <instance x="896" y="352" name="XLXI_1" orien="R0">
        </instance>
        <branch name="G,G,G,G,G,G,G,V,G,G,G,G,G,G,G,G">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="784" y="320" type="branch" />
            <wire x2="896" y1="320" y2="320" x1="784" />
        </branch>
        <iomarker fontsize="28" x="1440" y="320" name="O(15:0)" orien="R0" />
    </sheet>
</drawing>