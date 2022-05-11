# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF af1307778ec15e07380c4d2ec6190afe66f77fb9 # 0.1.1
    SHA512 041f8aacd0d11ae1ffb8a961d70ffe3b35a9b7806d10bc74971c47bf50a43b0130c55a89358136283f98116f995fb740f3706128a0e76b60185aa6ac9b45ef0d
    HEAD_REF master
)

# 将头文件和许可证复制到vcpkg包目录中
file(INSTALL ${SOURCE_PATH}/include/lotools DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)
# vcpkg_copy_pdbs()

