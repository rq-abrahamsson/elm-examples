var casual = require('casual');


casual.define('post', function(id, nrOfUsers) {
  return {
    id: id || casual.random,
    title: casual.title,
    body: casual.text,
    authorId: casual.integer(from = 1, to = 1000),
  };
});

casual.define('user', function(id, username) {
  return {
    id: id || casual.random,
    email: casual.email,
    username: username || casual.username,
    firstname: casual.first_name,
    lastname: casual.last_name,
    password: casual.password
  };
});


var data = {users: [], posts: []}
var nrOfPosts = 10;
var nrOfUsers = 10;
var loggedInName = "robin";

for (var i = 1; i < nrOfPosts; i++) {
  data.users.push(casual.user(i))
}
data.users.push(casual.user(i, loggedInName))
data["profile"] = { name: loggedInName }

for (var i = 1; i <= nrOfUsers; i++) {
  data.posts.push(casual.post(i))
}
console.log(JSON.stringify(data, null, 2));
