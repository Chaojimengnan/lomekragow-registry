# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/my-windows
    REF 7452b21023fedee3c0cb4cd1bd374ab44dc9399d # 1.0.9
    SHA512 50f34d3cd4826cc5f12fddb14283438c8cc9798e313f3fc8901f4a76098f7d2aabab42bffea947aa38d3ad52902ad68ed8a241ca4c2d976ed9d09e4c7fe5a385
    HEAD_REF master
)

# 删除除了头文件的其他文件
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj)
file(REMOVE ${SOURCE_PATH}/my_windows/my_windows.vcxproj.filters)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/my_windows DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/my-windows RENAME copyright)
vcpkg_copy_pdbs()

