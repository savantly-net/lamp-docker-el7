<?php
/** 
 * Test error
 * 
 * @author  Jeremy Branham <support@savantly.net>
 * @license Apache 2.0
 * */
    echo "you should see error output in your container logging";

    throw new Exception('Test exception');

?>