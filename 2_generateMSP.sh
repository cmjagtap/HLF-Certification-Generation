createMSPPeer0() {
  
fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7054 --caname ca.org1.example.com -M ${PWD}/crypto-config-ca/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp  --csr.names C=IN,ST=MH,L=Pune,O=org1,OU=peer  --csr.hosts peer0.org1.example.com --tls.certfiles ${PWD}/fabric-ca/org1/tls-cert.pem

  fabric-ca-client enroll -u https://peer0:peer0pw@localhost:7054 --caname ca.org1.example.com -M ${PWD}/crypto-config-ca/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls --enrollment.profile tls  --csr.names C=IN,ST=MH,L=Pune,O=org1,OU=peer  --csr.hosts peer0.org1.example.com --csr.hosts localhost --tls.certfiles ${PWD}/fabric-ca/org1/tls-cert.pem
}


generateAdminMSP() {
  
fabric-ca-client enroll -u https://org1admin:org1adminpw@localhost:7054 --caname ca.org1.example.com -M ${PWD}/crypto-config-ca/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp  --csr.names C=IN,ST=MH,L=Pune,O=org1,OU=admin  --tls.certfiles ${PWD}/fabric-ca/org1/tls-cert.pem

}
createMSPPeer0
generateAdminMSP
