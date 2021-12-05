# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/my-windows
    REF 1f35cd9539b21208312767346bdab11e83912f53 # 1.0.3
    SHA512 b89766ba686a526cf405b78d4cdd685a0ccf92b231108c4591b52614fd933a63270cec55cfa80dd38c3111a1f43469b9018895010d5fa92dd459a2ab610f01e5
    HEAD_REF master
)

# 删除除了头文件的其他文件
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj)
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj.filters)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/my_windows DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/my-windows RENAME copyright)
vcpkg_copy_pdbs()

