# tumige-memo

`tumige-memo` is a web application designed to help gamers track their backlog ("Tsumige"), visualize their progress, and record post-game feedback to enhance their sense of achievement.

> [!IMPORTANT]
> This is a personal project for learning Ruby on Rails. To focus on my own learning process, I kindly ask that you refrain from providing technical advice or suggestions via Issues or Pull Requests at this time. Thank you for your understanding and support!

# DEMO

(Coming Soon)

# Features

- **Backlog Management**: Track your game status (Unplayed, Playing, Cleared).
- **Reviews & Ratings**: Record your thoughts and rate games (star ratings) after completion.
- **Progress Visualization**: Stay motivated by seeing your backlog shrink as you finish games.

# Tech Stack

- **Ruby**: 3.4.8
- **Rails**: 8.1.3
- **Database**: PostgreSQL
- **Environment**: Docker / Docker Compose
- **Testing**: RSpec
- **Frontend**: Tailwind CSS / esbuild

# Installation

Follow these steps to set up the environment using Docker.

1. Clone the repository:

```bash
git clone https://github.com/kouta-wolf/tumige-memo.git
cd tumige-memo
```

Ensure your current directory is tumige-memo, then run the following commands:

```Bash
$ docker compose build
```

# Prepare the database (create and migrate)
```bash
$ docker compose run --rm web rails db:prepare
```

Start the application:

```bash
$ docker compose up
```

Once the setup is complete, you can access the application at http://localhost:3000.
Note
Docker configurations may require minor adjustments depending on your local environment.
Please manage environment variables (e.g., .env files) manually as needed for your setup.


# Author
Creator: kouta-wolf
License
"tumige-memo" is released under the MIT license.

# Etc
[ERD](https://drive.google.com/file/d/1v9MZNM2VHd5vGtF-5CtnPfMKHTlbj8b-/view?usp=sharing)
