

CREATE TABLE Users (
      user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
      username varchar(255) not NULL,
      email varchar(255) not NULL,
      password varchar(255) not NULL,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);


CREATE TABLE Boards (
      board_id BIGINT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(255) NOT NULL,
      description TEXT

);



CREATE TABLE Posts  (
         post_id BIGINT AUTO_INCREMENT PRIMARY KEY,
         title VARCHAR(255) NOT NULL,
         content TEXT NOT NULL,
         user_id BIGINT,
         board_id BIGINT,
         FOREIGN KEY (user_id) REFERENCES Users (user_id),
         FOREIGN KEY (board_id) REFERENCES Boards (board_id),
         created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Comments  (

                    comment_id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                    content TEXT NOT NULL,
                    user_id BIGINT,
                    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
                    post_id BIGINT,
                    FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
                    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE Tags  (
                    tag_id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
                    name VARCHAR(255) NOT NULL
);

CREATE TABLE Post_Tags  (

                    post_id BIGINT ,
                     FOREIGN KEY (post_id) REFERENCES Posts(post_id) ON DELETE CASCADE,
                    tag_id BIGINT,
                     FOREIGN KEY (tag_id) REFERENCES Tags(tag_id) ON DELETE CASCADE
);
