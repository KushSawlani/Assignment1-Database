--users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE NOT NULL,
    phone_number VARCHAR(10) UNIQUE NOT NULL
);

--tweets table
CREATE TABLE tweets (
    tweet_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    content TEXT NOT NULL,
    Tweeted_Time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

--likes table
CREATE TABLE likes (
    like_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    tweet_id INTEGER NOT NULL,
    Like_time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id)
);

--retweets table
CREATE TABLE retweets (
    retweet_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    original_tweet_id INTEGER NOT NULL,
    Retweet_Time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (original_tweet_id) REFERENCES tweets(tweet_id)
);

--comments table
CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    tweet_id INTEGER UNIQUE NOT NULL,
    parent_comment_id INTEGER,
    Comment_time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
    FOREIGN KEY (parent_comment_id) REFERENCES tweets(tweet_id)
);

--followers table
CREATE TABLE followers (
    follower_id SERIAL PRIMARY KEY,
    following_user_id INTEGER NOT NULL,
    follower_user_id INTEGER NOT NULL,
    Follow_Time TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY (following_user_id) REFERENCES users(user_id),
    FOREIGN KEY (follower_user_id) REFERENCES users(user_id)
);