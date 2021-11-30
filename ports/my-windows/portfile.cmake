# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/my-windows
    REF 18c7af94041632eec7353d8f0ad1f52b3947eb45
    SHA512 74d7d4f4ed0a03ff9eddc70b5b9b8389598a496e6f06cb6f78f0a602fe544c300f7c624e0eab9b7ddc79a2f906d9afb114d036c24c89350ad8cf5b1c543c74c3
    HEAD_REF master
)

# 删除除了头文件的其他文件
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj)
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj.filters)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/my_windows DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/my-windows RENAME copyright)
vcpkg_copy_pdbs()

