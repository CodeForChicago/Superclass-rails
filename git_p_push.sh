echo "git status:"
git status
# prompt for user input
echo "Do you wish to add these files?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git add -A; break;;
        No ) exit;;
    esac
done
echo "git status:"
git status
# prompt for user input for commit message
echo "Do you wish to install this program?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "What is your commit message?";
	      read message;
	      git commit -m $message; break;;
        No ) exit;;
    esac
done
echo "git status:"
git status
echo "Ready to push?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git push origin master; break;;
        No ) exit;;
    esac
done
