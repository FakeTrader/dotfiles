#!/usr/bin/env bash

# * backup
mkdir -p $HOME/.backup
cp $HOME/.bash_aliases  $HOME/.backup/.bash_aliases
cp $HOME/.bash_profile  $HOME/.backup/.bash_profile
cp $HOME/.bash_logout   $HOME/.backup/.bash_logout
cp $HOME/.bashrc        $HOME/.backup/.bashrc
cp $HOME/.profile       $HOME/.backup/.profile
sudo cp /etc/sudoers    $HOME/.backup/etc/sudoers


# macOS

ln -s $PWD/.bashrc.d  $HOME/.bashrc.d

ln $PWD/.bash_aliases $HOME/.bash_aliases
ln $PWD/.bash_profile $HOME/.bash_profile
ln $PWD/.bash_logout  $HOME/.bash_logout
ln $PWD/.bashrc       $HOME/.bashrc

ln $PWD/.profile      $HOME/.profile





# symlink
# ! use absolute path on Linux
ln -sf $PWD/.bashrc.d     $HOME/.bashrc.d

ln -sf $PWD/.bash_aliases $HOME/.bash_aliases
ln -sf $PWD/.bash_profile $HOME/.bash_profile
ln -sf $PWD/.bash_logout  $HOME/.bash_logout
ln -sf $PWD/.bashrc       $HOME/.bashrc
ln -sf $PWD/.profile      $HOME/.profile

# unlink
# unlink $HOME/.bash_aliases
# unlink $HOME/.bash_profile
# unlink $HOME/.bash_logout
# unlink $HOME/.bashrc
# unlink $HOME/.profile


# custom configs
cat < EOF > $HOME/.bashrc
# custom configs
for file in $HOME/.bashrc.d/*.bash; do
    . $file
done
EOF
