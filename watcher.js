const Database = require("./database.js");
module.exports = ({ mysql, token }) => {
    const
        con = new Database(mysql),
        io = require("socket.io-client"),
        socket = io('wss://socket.donationalerts.ru:443');

    socket.emit("add-user", { token: token, type: "minor" });
    socket.on("donation", (message) => {
        message = JSON.parse(message);
        return con.uploadDonation({
            username: message.username,
            money: { amount: [message.amount, message.amount_main], currency: message.currency },
            comment: message.message
        });
    });
};