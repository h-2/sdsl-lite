get_filename_component(file_name ${download_url} NAME)
set(test_case_tar_gz ${test_case_dir}/${file_name})
message("test_case_tar_gz=${test_case_tar_gz}")
file(DOWNLOAD ${download_url} ${test_case_tar_gz} STATUS status SHOW_PROGRESS)
list(GET status 0 status_code)
if(NOT ${status_code} EQUAL 0)    
    MESSAGE(FATAL_ERROR "Downloading test file failed.\n ${status}\n")
endif(NOT ${status_code} EQUAL 0)    
execute_process(COMMAND ${CMAKE_COMMAND} -E tar xzf ${test_case_tar_gz}
                WORKING_DIRECTORY ${test_case_dir})
