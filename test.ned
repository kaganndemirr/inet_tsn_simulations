//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

import inet.networks.base.TsnNetworkBase;
import inet.node.contract.IEthernetNetworkNode;
import inet.node.ethernet.Eth1G;

network test extends TsnNetworkBase
{
    submodules:
        cam1: <> like IEthernetNetworkNode {
            @display("p=2160.4749,803.225");
        }
        cam2: <> like IEthernetNetworkNode {
            @display("p=1608.6749,398.275");
        }
        daCam: <> like IEthernetNetworkNode {
            @display("p=1702.125,616.325");
        }
        hu: <> like IEthernetNetworkNode {
            @display("p=1682.1,938.94995");
        }
        cam3: <> like IEthernetNetworkNode {
            @display("p=1608.6749,1212.625");
        }
        sw1: <> like IEthernetNetworkNode {
            @display("p=1466.2749,772.07495");
        }
        sw2: <> like IEthernetNetworkNode {
            @display("p=1119.1749,772.07495");
        }
        rse: <> like IEthernetNetworkNode {
            @display("p=1288.275,938.94995");
        }
        telematics: <> like IEthernetNetworkNode {
            @display("p=1288.275,629.675");
        }
        cu: <> like IEthernetNetworkNode {
            @display("p=1101.375,996.8");
        }
        cdAudioDVD: <> like IEthernetNetworkNode {
            @display("p=1088.025,616.325");
        }
        cam4: <> like IEthernetNetworkNode {
            @display("p=602.975,803.225");
        }
        masterClock: <> like IEthernetNetworkNode if typename != "" {
            @display("p=683.07495,480.59998;i=device/card");
        }
    connections:
        cam1.ethg++ <--> Eth1G <--> sw1.ethg++;
        hu.ethg++ <--> Eth1G <--> sw1.ethg++;
        daCam.ethg++ <--> Eth1G <--> sw1.ethg++;
        cam2.ethg++ <--> Eth1G <--> sw1.ethg++;
        cam3.ethg++ <--> Eth1G <--> sw1.ethg++;
        sw1.ethg++ <--> Eth1G <--> sw2.ethg++;
        rse.ethg++ <--> Eth1G <--> sw2.ethg++;
        telematics.ethg++ <--> Eth1G <--> sw2.ethg++;
        cu.ethg++ <--> Eth1G <--> sw2.ethg++;
        cdAudioDVD.ethg++ <--> Eth1G <--> sw2.ethg++;
        cam4.ethg++ <--> Eth1G <--> sw2.ethg++;
        masterClock.ethg++ <--> Eth1G <--> sw2.ethg++ if exists(masterClock);
}
