# K-Info 디자인 요청 프롬프트 모음

> Google Stitch, Figma AI, 또는 다른 AI 디자인 도구에 복사해서 사용하세요.

---

## 1. 전체 앱 디자인 요청 (메인)

```
Design a premium mobile app UI for "K-Info" - an information app for foreigners living in Korea.

BRAND IDENTITY:
- Primary color: Navy Blue (#1A237E) - represents trust, professionalism, stability
- Secondary color: Gold (#D4AF37) - represents premium quality, success, elegance
- Background: Pure White (#FFFFFF) and Off-White (#FAFAFA)
- Text: Dark Grey (#212121) for headings, Grey (#757575) for body

BRAND FEELING:
✓ Trustworthy - like a reliable banking app
✓ Premium - luxury feel with gold accents
✓ Clean - minimalist and organized
✓ Professional - business-appropriate
✓ Welcoming - warm and friendly

TARGET USERS:
- Chinese, Taiwanese, Hong Kong residents in Korea
- Age 25-45, professionals and students
- Looking for visa, news, and life information

SCREENS NEEDED:
1. Splash Screen - Navy background, K-Info logo with gold accent
2. Home Screen - News feed with category filters
3. News Card Component - Image, title, summary, metadata
4. Guide Screen - Visa and TOPIK information sections
5. Settings Screen - Language selection, preferences
6. Bottom Navigation - 3 tabs (News, Guide, Settings)

DESIGN STYLE:
- Material Design 3
- Card-based layouts
- Rounded corners: 16px (cards), 12px (buttons), 24px (chips)
- Subtle shadows: rgba(26, 35, 126, 0.08)
- Smooth transitions and micro-interactions

Please create a cohesive design system with these specifications.
```

---

## 2. 스플래시 화면

```
Design a splash/loading screen for K-Info app.

Background: Solid Navy Blue (#1A237E)

Center content:
- App logo: "K-Info" text
- "K" in Gold (#D4AF37), "Info" in White (#FFFFFF)
- Subtle gold line accent under the logo
- Loading indicator at bottom (optional)

Tagline below logo:
"Your Trusted Guide to Life in Korea"
Color: White with 80% opacity

Style: Elegant, minimal, premium feel
Animation suggestion: Logo fades in, gold accent animates left to right
```

---

## 3. 홈 화면 (뉴스 피드)

```
Design a news feed home screen for K-Info mobile app.

HEADER (App Bar):
- Background: Navy Blue (#1A237E)
- Title: "K-Info" in white, left aligned
- Right side: Notification bell icon, Profile avatar icon
- Height: 56px

CATEGORY FILTER:
- Horizontal scrollable chips
- Options: All, Economy, Entertainment, Society
- Selected state: Navy background, white text
- Unselected state: White background, navy border, navy text
- Chip style: Rounded pill shape, 32px height

NEWS CARDS (multiple):
- White background (#FFFFFF)
- Border radius: 16px
- Shadow: 0 4px 12px rgba(26, 35, 126, 0.08)
- Padding: 16px

Card content:
- Featured image: 16:9 ratio, rounded top corners
- Category badge: Gold background, small, top-left of image
- Title: 18px, bold, dark grey, max 2 lines
- Summary: 14px, grey, max 2 lines
- Footer row: Source name + Time ago (e.g., "Korea Times • 2h ago")

BOTTOM NAVIGATION:
- Background: White
- 3 items: News (home icon), Guide (document icon), Settings (gear icon)
- Active: Navy icon with gold underline indicator
- Inactive: Grey icon
- Height: 64px

Overall: Clean, professional, easy to scan
```

---

## 4. 뉴스 상세 화면

```
Design a news article detail screen for K-Info app.

HEADER:
- Back arrow (left)
- Title: "News Detail"
- Share icon (right)
- Navy background

CONTENT:
- Hero image: Full width, 250px height
- Title: 24px, bold, dark, below image
- Metadata row: Source + Date (e.g., "Korea Times | Feb 5, 2026")
- Divider line
- Article summary/body: 16px, comfortable line height (1.6)

ACTION BUTTONS (bottom):
- Primary: "View Original" - Navy background, white text, full width
- Secondary: "Share" - White background, navy border

RELATED NEWS SECTION:
- "Related News" header
- 2-3 horizontal scrollable small news cards

Colors: Navy header, white content area, gold accents on buttons
```

---

## 5. 가이드 화면

```
Design a Guide/Information hub screen for K-Info app.

HEADER:
- Navy Blue (#1A237E) background
- Title: "Guides" in white
- No back button (it's a main tab)

CONTENT SECTIONS:

Section 1 - Visa Information:
- Section title: "Visa Information" - 20px, bold, dark grey
- Large card:
  - White background, 16px radius, shadow
  - Left: Passport/document icon in navy
  - Title: "Visa Information"
  - Subtitle: "F-2, F-4, F-5, E-7 visa guides and requirements"
  - Right: Chevron arrow
  - Gold accent line on left border

Section 2 - TOPIK Information:
- Section title: "TOPIK Test" - 20px, bold, dark grey
- Large card:
  - Same style as above
  - Left: Book/graduation cap icon in navy
  - Title: "TOPIK Information"
  - Subtitle: "Exam schedule, level guides, study resources"
  - Right: Chevron arrow
  - Gold accent line on left border

BOTTOM NAVIGATION:
- Guide tab should be active (navy with gold indicator)

Style: Clean sections, easy to tap, informative but not cluttered
```

---

## 6. 비자 정보 화면

```
Design a Visa Information detail screen for K-Info app.

HEADER:
- Back arrow + "Visa Information" title
- Navy background

CONTENT - Expandable Cards:

Create 6 visa type cards that can expand:

Card structure (collapsed):
- Left: Visa type code (e.g., "F-2") in navy, bold
- Right side: Visa name (e.g., "Long-term Residence")
- Expand/collapse chevron icon
- White background, subtle shadow

Card structure (expanded):
- Shows all collapsed info plus:
- Description paragraph
- "Requirements" subheading with gold underline
- Bullet point list of requirements
- Each bullet has a small gold dot

Visa types to show:
1. F-2 - Long-term Residence
2. F-4 - Overseas Korean
3. F-5 - Permanent Residence
4. E-7 - Special Occupation
5. D-10 - Job Seeker
6. D-2 - Student

Colors: Navy headers, white cards, gold accents on bullets and dividers
Animation: Smooth expand/collapse with 0.3s ease
```

---

## 7. 설정 화면

```
Design a Settings screen for K-Info app.

HEADER:
- Navy background
- Title: "Settings"

SECTIONS:

Section 1 - Language:
- Section header: "Language" with globe icon
- Options as radio buttons:
  ○ English
  ● 简体中文 (Simplified Chinese) - selected
  ○ 繁體中文 (Traditional Chinese)
- Selected option has navy circle with white checkmark
- Gold accent on selected row background (very subtle)

Section 2 - Preferences:
- Section header: "Preferences"
- Toggle items:
  - Push Notifications [ON/OFF toggle]
  - Dark Mode [ON/OFF toggle]
- Toggle ON state: Navy background with white circle
- Toggle OFF state: Grey background

Section 3 - About:
- Section header: "About"
- Items (tap to navigate):
  - About K-Info →
  - Privacy Policy →
  - Terms of Service →
  - Version 1.0.0 (no arrow, just info)

BOTTOM:
- "Made with ♥ in Korea" text, centered, grey, small

Style: Clean list format, clear sections, easy to understand
```

---

## 8. 컴포넌트 디자인

```
Design a UI component library for K-Info app.

COLOR PALETTE:
- Navy: #1A237E (primary)
- Navy Light: #534bae
- Navy Dark: #000051
- Gold: #D4AF37 (accent)
- Gold Light: #FFE082
- White: #FFFFFF
- Off-White: #FAFAFA
- Grey: #9E9E9E
- Dark Grey: #424242
- Black: #212121

BUTTONS:
1. Primary Button: Navy bg, white text, 12px radius, 48px height
2. Secondary Button: White bg, navy border, navy text
3. Accent Button: Gold bg, navy text
4. Text Button: No bg, navy text, underline on hover

CARDS:
1. News Card: Image + title + summary + metadata
2. Guide Card: Icon + title + subtitle + arrow
3. Info Card: Expandable with requirements list

CHIPS/TAGS:
1. Filter Chip: Selected (navy) / Unselected (white+border)
2. Category Badge: Gold bg, small, rounded

INPUT FIELDS:
1. Search Bar: White bg, grey border, search icon
2. Dropdown: White bg, navy border, chevron

ICONS:
- Style: Outlined, 2px stroke
- Size: 24px default
- Color: Navy (active), Grey (inactive)

NAVIGATION:
1. App Bar: Navy, 56px height
2. Bottom Nav: White, 64px height, 3 items

Please create a cohesive component sheet with all these elements.
```

---

## 9. 다크 모드

```
Design dark mode variants for K-Info app.

DARK MODE COLORS:
- Background: #121212 (Dark surface)
- Card Background: #1E1E1E
- Navy Primary: #5C6BC0 (Lighter navy for dark mode)
- Gold: #FFD54F (Brighter gold for visibility)
- Text Primary: #FFFFFF
- Text Secondary: #B0B0B0
- Dividers: #2C2C2C

Apply to:
1. Home Screen
2. Guide Screen
3. Settings Screen (with dark mode toggle ON)

Keep the same layout, just adjust colors for dark mode.
Ensure good contrast and readability.
Gold accents should pop more in dark mode.
```

---

## 사용 방법

1. **Google Stitch** 또는 원하는 AI 디자인 도구 열기
2. 위 프롬프트 중 원하는 것 복사
3. 도구에 붙여넣기
4. 생성된 디자인 다운로드
5. `design/google_stitch/` 폴더에 저장
6. 이름 규칙: `screen_name_v1.png` (예: `home_screen_v1.png`)

---

*Created: 2026-02-05*
