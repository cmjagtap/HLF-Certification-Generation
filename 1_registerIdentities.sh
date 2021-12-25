
 mkdir -p crypto-config-ca/peerOrganizations/org1.example.com
 export FABRIC_CA_CLIENT_HOME=${PWD}/crypto-config-ca/peerOrganizations/org1.example.com

enrollCAAdmin() {
  
  fabric-ca-client enroll -u https://admin:adminpw@localhost:7054 --caname ca.org1.example.com --csr.names C=IN,ST=MH,L=Pune,O=org1,OU=peer  --tls.certfiles ${PWD}/fabric-ca/org1/tls-cert.pem
}

registerIdentities() {

  fabric-ca-client register --caname ca.org1.example.com --id.name peer0 --id.secret peer0pw --id.type peer --csr.names C=IN,ST=MH,L=Pune,O=org1,OU=peer  --tls.certfiles ${PWD}/fabric-ca/org1/tls-cert.pem

  fabric-ca-client register --caname ca.org1.example.com --id.name org1admin --id.secret org1adminpw --id.type admin --csr.names C=IN,ST=MH,L=Pune,O=org1,OU=admin  --tls.certfiles ${PWD}/fabric-ca/org1/tls-cert.pem
}
enrollCAAdmin
registerIdentities
