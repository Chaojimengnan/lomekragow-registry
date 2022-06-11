# 仅头文件端口

# 从github存储库中获取源代码
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chaojimengnan/lotools
    REF f1c07295d5294bfb7a3cf6e312499b4f7f999a1d # 0.1.6
    SHA512 749ebaf467ad02306adbb7e7d777bfcea4753025424aba05df0d7b22309d334a0e44e72556ba369708d0ebe6f81de7356f33957a7f768f9e873f919037e259e8
    HEAD_REF master
)

# 将我们自己的CMakeLists.txt复制到目录，因为这个是特别为vcpkg准备的
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

# 配置cmake
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

# 构建并安装
vcpkg_install_cmake()

# 修正配置文件
vcpkg_fixup_cmake_targets()

# 生成的库分为debug和release，但是头文件仅需要保留一份，所以删除debug/include
# 又由于这是一个仅头文件库，所以不需要debug，所以直接删除
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/lotools RENAME copyright)

# 复制usage
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")