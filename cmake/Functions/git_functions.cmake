function( find_branch_name )
	# This function finds the branch or tag name of the input repository
	# If a branch is checkout GIT_BRANCH_FUNC will be set to the current branch
	# If a tagged version is checkout GIT_TAG_FUNC will be set to the current tag
	set( single_value_args REPO_DIR_NAME )
	cmake_parse_arguments( _p "${options}" "${single_value_args}" "${multi_value_args}" ${_FIRST_ARG} ${ARGN})

  execute_process(
    COMMAND bash "-c" "git symbolic-ref -q --short HEAD"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${_p_REPO_DIR_NAME}"
    OUTPUT_VARIABLE GIT_BRANCH
		ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE )
  set( GIT_BRANCH_FUNC ${GIT_BRANCH} PARENT_SCOPE )

	execute_process(
    COMMAND bash "-c" "git describe --tags --exact-match"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${_p_REPO_DIR_NAME}"
    OUTPUT_VARIABLE GIT_TAGS
		ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE )
  set( GIT_TAG_FUNC ${GIT_TAGS} PARENT_SCOPE )

endfunction( find_branch_name)

#############################################

function( branch_checkout )
	# This function gets the repo name in the bundle and a branch name or a tag
	# Then it will checkout that branch/tag in the input repository
  set( single_value_args REPO_DIR_NAME BRANCH )
	cmake_parse_arguments( _p "${options}" "${single_value_args}" "${multi_value_args}" ${_FIRST_ARG} ${ARGN})
  execute_process(
    COMMAND bash "-c" "git checkout ${_p_BRANCH}"
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/${_p_REPO_DIR_NAME}"
		RESULT_VARIABLE BRANCH_AVAILABLE_RESULT
		OUTPUT_VARIABLE BRANCH_AVAILABLE
		OUTPUT_QUIET
		ERROR_QUIET
    OUTPUT_STRIP_TRAILING_WHITESPACE )

	if( ${BRANCH_AVAILABLE_RESULT} EQUAL 0 )
    message( STATUS "BRANCH/TAG ${_p_BRANCH} is available in ${_p_REPO_DIR_NAME}" )
	elseif( ${BRANCH_AVAILABLE_RESULT} EQUAL 1)
    message( STATUS "BRANCH/TAG ${_p_BRANCH} is NOT available in ${_p_REPO_DIR_NAME}" )
	endif()
endfunction( branch_checkout )
