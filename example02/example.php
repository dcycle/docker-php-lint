<?php

/**
 * @file
 * Dummy file.
 */

// this should FAIL because the comment is not in the correct format.
// see ./test.sh
function dummy_function(string $a, string $b) : string {
  return $a . ' ' . $b;
}
