module.exports = (srv) => {

    //Implementation
    srv.on('hello', (req) => {
        let myName = req.data.name;
        return "Hello " + myName;
    });

}