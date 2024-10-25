const {Block,BlockChain} = require('./blockchain.js') 

let mb = new BlockChain();

console.log("First Transaction");
mb.addBlock(new Block(1, '25/10/2024',23,5));

console.log(JSON.stringify(mb, null, 3));