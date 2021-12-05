# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/my-windows
    REF 916f945d8d1bfce1db9b5f26849b4593fb57eaf1 # 1.0.2
    SHA512 c7a9273dd5f03434f1daea7e1b8346f5627b4f4562f574733a9a77a4ae7c532895a61b145f6eab040528fae4eac465dcc51d1183c8751502bd387a2531a45de6
    HEAD_REF master
)

# 删除除了头文件的其他文件
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj)
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj.filters)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/my_windows DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/my-windows RENAME copyright)
vcpkg_copy_pdbs()

