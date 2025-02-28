set -e

bundle install
yarn install
bundle exec rails assets:precompile
chmod +x ./bin/render-build.sh