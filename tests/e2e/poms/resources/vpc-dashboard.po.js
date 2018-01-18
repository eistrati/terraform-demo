import { Selector } from 'testcafe';
import { isVisible } from '../../config';

const VpcDashboard = {
  selectVpcInput: Selector('#gwt-debug-sh-selector > div > div > input', isVisible),
  yourVpcs: Selector('#gwt-debug-sh-vpc', isVisible),
  subnets: Selector('#gwt-debug-sh-subnets', isVisible),
  routetables: Selector('#gwt-debug-sh-routetables', isVisible),
  internetGateways: Selector('#gwt-debug-sh-igws', isVisible),
  egressOnlyInternetGateways: Selector('#gwt-debug-sh-eoigws', isVisible),
  DHCPOptionsSets: Selector('#gwt-debug-sh-dhcp', isVisible),
  elasticIPs: Selector('#gwt-debug-sh-eip', isVisible),
  endpoints: Selector('#gwt-debug-sh-endpoints', isVisible),
  endpointServices: Selector('#gwt-debug-sh-endpointServices', isVisible),
  natgateway: Selector('#gwt-debug-sh-natgateway', isVisible),
  peeringConnections: Selector('#gwt-debug-sh-peering', isVisible),
  networkACLs: Selector('#gwt-debug-sh-acl', isVisible),
  securitygroup: Selector('#gwt-debug-sh-securitygroup', isVisible),
  customerGateways: Selector('#gwt-debug-sh-cgws', isVisible),
  virtualPrivateGateways: Selector('#gwt-debug-sh-vgws', isVisible),
  VPNConnections: Selector('#gwt-debug-sh-vpns', isVisible),
  searchInput: Selector('#gwt-TextBox', isVisible)
};

module.exports = {
  VpcDashboard
}
