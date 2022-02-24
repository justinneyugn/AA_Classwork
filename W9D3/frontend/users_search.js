const APIUtil = require("./api_util");

class UsersSearch {
    constructor(el) {
        this.$el = $(el);
        // this.$input = this.$el.children('input')[0];
        this.$input = $('.users-search input');
        console.log(this.$input);
        this.$ul = $('.users-search ul');
        this.handleInput();
    }

    render(users){
        users.forEach(user => {
            this.$ul.empty();
            this.$ul.append($("<li><a href= '/users/"+ user.id + "'>" + user.username + "</a></li>"));
        });
    }

    handleInput(){
        $(this.$input).on('input', e => {
            e.preventDefault();
            APIUtil.searchUsers(this.$input.val())
            .then(res => {
                console.log(res);
                this.render(res);
            });
        });
    }
}
module.exports = UsersSearch;