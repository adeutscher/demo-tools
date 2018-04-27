
if [ -n "$demoToolsDir" ]; then

    update-tools-demo(){

        # Make sure that some joker didn't go and unset the demoToolsDir 
        #     variable after this function was defined.
        if [ -z "$demoToolsDir" ]; then
            error 'demo tools directory is unknown! It should be recorded in the $demoToolsDir variable.'
            return 1
        fi

        update-repo "$demoToolsDir" "demo tools"

        # Confirm the permissions on the module directory
        #     Do this whether or not the SVN update actually succeeded.
        chmod 700 "$demoToolsDir"

    }

fi # end demoToolsDir check
