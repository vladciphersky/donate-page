const moment = require("moment");
const config = require("./config.json");
const pkg = require("./package.json");

const watcher = require("./watcher.js");
watcher({
    mysql: config.database,
    token: config.token
});

const Database = require("./database");
const con = new Database(config.database);

const express = require("express");
const app = express();

app.set("view engine", "ejs");
app.get("/", (req, res) =>
    con.getDonations(donations =>
        res.status(200).render("index", {
            query: donations[0].sort((x, y) => y.time - x.time),
            page: config.page,
            moment: moment,
            pkg: pkg
        })
    )
);

app.use((req, res, next) =>
    res.status(404).render("_error", {
        error: {
            code: 404,
            message: "Страница не найдена."
        },
        page: config.page,
        pkg: pkg
    })
);

app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).render("_error", {
        error: {
            code: 500,
            message: "Внутренняя ошибка сервера."
        },
        page: config.page,
        pkg: pkg
    });
});

app.listen(config.port, () => console.log(`* Server started on port: ${config.port}`));