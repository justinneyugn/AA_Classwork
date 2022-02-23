const APIUtil = require("./api_util");

class UsersSearch {
    constructor(el) {
        this.$el = $(el);
        this.$input = this.$el.children('input')[0];
        this.$ul = this.$el.children('ul')[0];
    }
}
module.exports = UsersSearch;