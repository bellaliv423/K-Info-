# K-Info AI 협업 노트

> 이 파일은 Claude와의 협업 기록, 작업 진행 상황, 의사결정 사항을 기록합니다.

---

## 프로젝트 개요

- **프로젝트명**: K-Info
- **목적**: 한국에 거주하는 외국인(중국, 대만, 홍콩)을 위한 정보 앱
- **GitHub**: https://github.com/bellaliv423/K-Info-.git
- **기술 스택**:
  - Flutter 3.10.7+
  - 상태관리: Riverpod
  - 라우팅: GoRouter
  - 백엔드: Supabase (미연결)
  - 다국어: intl (영어, 중국어 간체/번체)

---

## 현재 상태 (2026-02-06)

### 완료된 기능
- [x] 기본 프로젝트 구조 설정
- [x] 테마 시스템 (라이트/다크)
- [x] 다국어 지원 (영어, 중국어)
- [x] 홈 화면 (뉴스 피드) 기본 구현
- [x] 가이드 화면 기본 구현
- [x] 비자 정보 화면 구현
- [x] Bottom Navigation 설정
- [x] 디자인 시스템 문서 작성

### 미완성/Placeholder
- [ ] TopikInfoScreen (Placeholder)
- [ ] SettingsScreen (Placeholder)
- [ ] Supabase 연동 (주석 처리됨)
- [ ] 뉴스 상세 네비게이션 (TODO 상태)

---

## 파일 구조

```
lib/
├── main.dart                    # 앱 진입점
├── core/
│   ├── constants/               # API, UI 상수
│   ├── routing/app_router.dart  # GoRouter 설정
│   └── theme/                   # 테마 설정
├── data/
│   ├── models/                  # 데이터 모델
│   ├── providers/               # Riverpod 프로바이더
│   └── repositories/            # 데이터 저장소
├── features/
│   ├── home/                    # 홈(뉴스) 화면
│   ├── news/                    # 뉴스 상세
│   └── guide/                   # 가이드 섹션
├── shared/widgets/              # 공용 위젯
└── l10n/                        # 다국어 파일
```

---

## 오늘 작업 계획 (2026-02-06)

### 목표
1. AI 협업 프로세스 구축
2. 할일 관리 자동화 시스템 검토
3. 미완성 화면 구현 계획 수립

### 논의 필요 사항
- [ ] TopikInfoScreen 우선순위 및 기능 범위
- [ ] SettingsScreen 필요 기능 목록
- [ ] Supabase 연동 시점 및 우선순위
- [ ] 뉴스 데이터 소스 (API vs 정적 데이터)

---

## AI 협업 가이드라인

### 커밋 규칙
- 작업 완료 후 사용자 승인 받고 커밋
- GitHub: `bellaliv423/K-Info-` 리포지토리 확인 필수
- 다른 프로젝트로 잘못 커밋하지 않도록 주의

### 소통 원칙
- 불확실한 사항은 질문 먼저
- 주요 결정사항은 이 파일에 기록
- 작업 진행 상황 수시 업데이트

---

## 작업 로그

### 2026-02-06
- **13:00** - 프로젝트 리뷰 시작
- **13:10** - claude.md 파일 생성
- **13:15** - 프로젝트 구조 분석 완료
- **13:20** - AI 협업 프로세스 설정 완료
- **13:25** - 할일(Todo) 시스템 설정 완료
- **퇴근** - 오늘 작업 마무리 및 GitHub 커밋

#### 오늘 완료한 작업
- [x] 프로젝트 전체 리뷰
- [x] claude.md 협업 문서 생성
- [x] AI 협업 가이드라인 수립
- [x] 할일 관리 시스템 설정

#### 다음 세션 할 일 (미정 - 우선순위 논의 필요)
- [ ] TopikInfoScreen 구현
- [ ] SettingsScreen 구현
- [ ] Supabase 연동
- [ ] 뉴스 상세 네비게이션 완성

---

## 의사결정 기록

| 날짜 | 주제 | 결정 | 이유 |
|------|------|------|------|
| 2026-02-06 | 협업 문서 | claude.md 사용 | AI 협업 기록 및 컨텍스트 유지 |

---

## 참고 자료

- 디자인 가이드: `design/DESIGN_REQUEST_PROMPTS.md`
- 비자 규정 원본: `Dos/260102 HI KOREA_외국인 비자 규정_공식문서.hwp`
