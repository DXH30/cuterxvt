echo "Installing rxvt theme..."
echo "Checking if Xresources file already exists"
install_it() {
    echo "Copying Xresources to $HOME/.Xresources";
    cp -v "./Xresources" "$HOME/.Xresources";
    echo "Running xrdb ~/.Xresources and automatically reload config...";
    /usr/bin/xrdb "$HOME/.Xresources";
    echo "Copying theme complete";
    echo "Lets try open urxvt now";
    echo "Type urxvt";
}

read -p "Install Cuterxvt (Y/N)? " install_ya
if [[ "$install_ya" =~ Y|y ]]; then
    if [ -f "$HOME/.Xresources" ]; then
        read -p "Delete your .Xresources file (Y/N) ? " confirm
        if [[ "$confirm" =~ Y|y ]]; then
            rm -v "$HOME/.Xresources";
            install_it;
        elif [[ "$confirm" =~ N|n ]]; then
            echo "Installation cancelled..";
            break;
        else
            echo "Please select Y or N"
        fi
    else
        echo "Your file doesn't exist";
        install_it;
    fi
else
    echo "Installation cancelled..";
fi
