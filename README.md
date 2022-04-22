# Football highlights
Football highlights API built with [jets](https://rubyonjets.com/quick-start/).

## Getting Started
```
bundle install
jets s
```

### Deploying PROD
```
JETS_ENV=production jets db:migrate
JETS_AGREE=yes JETS_ENV=production AWS_PROFILE=fh jets deploy
```