const {Block,Blockchain} = require('./blockchain') 

let mb = new Blockchain();

console.log("First Transaction");
mb.addBlock(new Block(1, '25/10/2024',23,5));
mb.addBlock(new Block(2, '25/10/2024',23,5));

console.log(JSON.stringify(mb, null, 3));