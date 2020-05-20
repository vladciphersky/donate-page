class Database {
    constructor(database) {
        this.con = require("mysql2/promise").createPool(database);
    }

    getDonations(callback) {
        this.con.query("SELECT * FROM donations")
            .then((res) => callback(res)).catch(console.error);
    }

    uploadDonation({ username, money, comment }) {
        let donate = `${money.amount[0]} ${(money.currency !== "RUB") ? `${money.currency} (${money.amount[1]} RUB)` : money.currency}`;
        this.con.query(
            "INSERT INTO donations (username, money, comment) VALUES (?, ?, ?)",
            [username, donate, comment]
        ).then(() => console.log(`[!] Новый донат от ${username} (${donate})!\nКомментарий: ${comment}`)).catch(console.error);
    }
}

module.exports = Database;