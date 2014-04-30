#!/usr/bin/env bash
set -e

EMAIL_ADDRESS=$1
if [ ! $# -eq 1 ]; then
  echo "lamassu-setup-bitcoin-backup <email_address>"
else
  if [[ ! $EMAIL_ADDRESS =~ .+@.+\..+ ]]; then
    echo "Please enter a valid email address."
    echo
    echo "lamassu-setup-bitcoin-backup <email_address>"
    exit 1
  fi
fi

echo $EMAIL_ADDRESS > $HOME/.lamassu-backup.dat
echo -e "MAILTO=$EMAIL_ADDRESS\n00 05 * * * /usr/local/bin/lamassu-bitcoin-backup" | \
crontab -

echo "Backup set up successfully."
echo
echo "Please make sure you've imported your PGP key:"
echo "gpg --search-keys <email-address>"
