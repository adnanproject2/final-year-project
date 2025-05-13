# ------------------------------
# ✅ OPERATING SYSTEM
# ------------------------------
Linux (Ubuntu/Debian-based assumed)

# ------------------------------
# ✅ INSTALL RVM, RUBY & DEPENDENCIES
# ------------------------------
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

# Install Ruby 3.3.0
rvm install 3.3.0
rvm use 3.3.0 --default
ruby -v

# ------------------------------
# ✅ INSTALL GIT
# ------------------------------
sudo apt update
sudo apt install git -y
git --version

# ------------------------------
# ✅ INSTALL POSTGRES (Linux)
# ------------------------------
sudo apt install postgresql postgresql-contrib libpq-dev -y

# Create a PostgreSQL superuser with the same name as your Linux user
sudo -u postgres createuser -s $USER

# ------------------------------
# ✅ CLONE PROJECT
# ------------------------------
cd ~/Desktop
git clone git@github.com:adnanproject2/final-year-project.git
cd final-year-project

# ------------------------------
# ✅ INSTALL BUNDLER & DEPENDENCIES
# ------------------------------
gem install bundler
bundle install

# ------------------------------
# ✅ DATABASE SETUP
# ------------------------------
# (Ensure config/database.yml is set with correct PostgreSQL username)
rails db:create
rails db:migrate

# ------------------------------
# ✅ START RAILS SERVER
# ------------------------------
rails server
# Visit: http://localhost:3000

# ------------------------------
# ✅ ACCESS RAILS CONSOLE
# ------------------------------
rails console
