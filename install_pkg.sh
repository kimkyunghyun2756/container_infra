#!/usr/bin/env bash
# install pakages
# Vagrant provisioning script for CentOS 7 repo fix

set -e # 오류 발생 시 즉시 중단

echo "[INFO] CentOS-Base.repo를 vault.centos.org로 교체 중..."
sed -i 's|mirror.centos.org|vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|#baseurl=http|baseurl=http|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|mirrorlist=http|#mirrorlist=http|g' /etc/yum.repos.d/CentOS-Base.repo

echo "[INFO] yum 캐시 정리 중..."
yum clean all -y
echo "[INFO] yum 캐시 재생성 중..."
yum makecache -y

echo "[INFO] epel-release 설치 중..."
yum install -y epel-release

echo "[SUCCESS] CentOS7 repo fix 완료!"

yum install vim-enhanced -y