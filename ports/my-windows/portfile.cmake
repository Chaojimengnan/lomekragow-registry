# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/my-windows
    REF 85fc5c205cea0820c090ea2b46fee62c0bba552a # 1.0.10
    SHA512 c7278880304b9ca781a12f5b80b86b808496374972cfc27fb968e3a23fdfb7b48539143a05eda9bc34618316971fe38998a9a92c44c487f044132ef2502adf61
    HEAD_REF master
)

# 删除除了头文件的其他文件
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj)
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj.filters)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/my_windows DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/my-windows RENAME copyright)
vcpkg_copy_pdbs()

