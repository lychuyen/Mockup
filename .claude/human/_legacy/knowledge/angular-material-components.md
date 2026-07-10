---
name: angular-material-components
description: Catalog of all Angular Material components (6 official categories) for building mockups/wireframes that map 1:1 to real Material components. Each entry: selector, purpose, key variants/inputs, mockup-use note. Use when designing UI mockups so DEV implementation is faithful to Angular Material.
source: material.angular.dev/components/categories (categories verified 2026-06-03 via web search; per-component API = Angular Material reference, confirm exact props at the linked docs)
version: "1.1"
date: "2026-06-03"
---

> Bản gốc (AGENTS scope): `.claude/knowledge/angular-material-components.md`. Đồng bộ theo [SYNC-PROTOCOL.md](../../sync/SYNC-PROTOCOL.md). Related: [`.claude/rules/angular-guidelines.md`](../rules/angular-guidelines.md).

# Angular Material — Catalog Component cho Mockup (bản tiếng Việt)

**Purpose:** when authoring a mockup/wireframe (`ba/process/wireframe`, `ba/process/mockup`), map every UI element to a **real Angular Material component** below. This makes the mockup *implementable as-is* and keeps DEV faithful to the library. Official docs: `https://material.angular.dev/components/<component>`.

> Each Material component is `standalone` (import the `Mat*Module` or the standalone component). Catalog reflects Material 3 (MDC-based). For exact, current inputs/outputs, open the component's docs page.

---

## 1. Form Controls

| Component | Selector / import | Purpose & mockup use | Key variants / inputs |
|---|---|---|---|
| **Form field** | `<mat-form-field>` | Wrapper bao input/select/etc — label, hint, error, prefix/suffix | `appearance="fill\|outline"`, `floatLabel`, `<mat-label>`, `<mat-hint>`, `<mat-error>`, `<mat-icon matSuffix>` |
| **Input** | `matInput` (in form-field) | Ô nhập text/number/textarea | `type`, `placeholder`, `textarea` via `<textarea matInput>` |
| **Autocomplete** | `<mat-autocomplete>` + `matAutocomplete` | Input gợi ý dropdown khi gõ | `[displayWith]`, `<mat-option>`, filter logic |
| **Select** | `<mat-select>` | Dropdown chọn 1/nhiều | `multiple`, `<mat-option>`, `<mat-optgroup>`, `[compareWith]` |
| **Checkbox** | `<mat-checkbox>` | Bật/tắt boolean, chọn nhiều | `[checked]`, `indeterminate`, `labelPosition` |
| **Radio** | `<mat-radio-group>` + `<mat-radio-button>` | Chọn 1 trong nhiều | `value`, `labelPosition` |
| **Slide toggle** | `<mat-slide-toggle>` | Công tắc on/off (setting) | `[checked]`, `color`, `labelPosition` |
| **Slider** | `<mat-slider>` + `<input matSliderThumb>` | Chọn giá trị trong dải | `min/max/step`, range = 2 thumbs, `discrete`, `showTickMarks` |
| **Datepicker** | `<mat-datepicker>` + `[matDatepicker]` | Chọn ngày / dải ngày | single / `mat-date-range-input`, `startView`, `[min]/[max]` |
| **Timepicker** | `<mat-timepicker>` (Material 19+) | Chọn giờ | `[interval]`, 12/24h tùy locale |

> **Mockup note:** mọi field nhập liệu nên bọc trong `mat-form-field` với `appearance` nhất quán toàn dự án (chọn `outline` hoặc `fill` một lần). Ghi rõ label/hint/validation để map sang `mat-error`.

## 2. Navigation

| Component | Selector | Purpose & mockup use | Key variants / inputs |
|---|---|---|---|
| **Toolbar** | `<mat-toolbar>` | Thanh tiêu đề/app bar trên cùng | `color`, multi-row (nhiều `<mat-toolbar-row>`) |
| **Sidenav** | `<mat-sidenav-container>` + `<mat-sidenav>` | Ngăn điều hướng bên | `mode="over\|push\|side"`, `opened`, `position`; `mat-drawer` cho nội dung non-app |
| **Menu** | `<mat-menu>` + `[matMenuTriggerFor]` | Menu ngữ cảnh / dropdown thao tác | `<button mat-menu-item>`, nested menu, `xPosition/yPosition` |

## 3. Layout

| Component | Selector | Purpose & mockup use | Key variants / inputs |
|---|---|---|---|
| **Card** | `<mat-card>` | Khối nội dung gom nhóm | `<mat-card-header>`, `-title`, `-content`, `-actions`, `appearance="outlined\|raised"` |
| **Tabs** | `<mat-tab-group>` + `<mat-tab>` | Chia nội dung theo tab | `[selectedIndex]`, `mat-stretch-tabs`, lazy `*matTabContent` |
| **Stepper** | `<mat-stepper>` / `<mat-horizontal/vertical-stepper>` | Quy trình nhiều bước (wizard) | `linear`, `<mat-step>`, `editable`, `optional` |
| **Expansion panel** | `<mat-expansion-panel>` / `<mat-accordion>` | Khối thu gọn/mở rộng | `<mat-expansion-panel-header>`, `multi` (accordion), `hideToggle` |
| **List** | `<mat-list>` / `<mat-nav-list>` / `<mat-selection-list>` | Danh sách: hiển thị / điều hướng / chọn nhiều | `<mat-list-item>`, `<mat-list-option>` (checkbox) |
| **Grid list** | `<mat-grid-list>` | Lưới ô đều nhau (gallery/dashboard) | `cols`, `rowHeight`, `<mat-grid-tile>` `colspan/rowspan` |
| **Tree** | `<mat-tree>` | Dữ liệu phân cấp (cây) | flat / nested, `<mat-tree-node>`, toggle |
| **Divider** | `<mat-divider>` | Đường phân cách | `vertical`, `inset` |

## 4. Buttons & Indicators

| Component | Selector | Purpose & mockup use | Key variants / inputs |
|---|---|---|---|
| **Button** | `matButton` / `matIconButton` / `matFab` | Nút hành động | variants: basic, `matButton="elevated\|filled\|tonal\|outlined"`, icon button, FAB / mini-FAB / extended-FAB |
| **Button toggle** | `<mat-button-toggle-group>` | Nhóm nút chọn (segmented) | `multiple`, `value`, `appearance` |
| **Badge** | `matBadge` | Huy hiệu số/chấm trên element | `matBadgeColor`, `matBadgePosition`, `matBadgeSize`, `matBadgeOverlap` |
| **Chips** | `<mat-chip-set>` / `<mat-chip-listbox>` / `<mat-chip-grid>` | Thẻ: hiển thị, lọc (filter), nhập (input) | `<mat-chip>`, `<mat-chip-option>` (selectable), `<mat-chip-row>` (editable + remove) |
| **Icon** | `<mat-icon>` | Biểu tượng | font (Material Symbols) hoặc SVG đăng ký qua `MatIconRegistry` |
| **Progress spinner** | `<mat-progress-spinner>` / `<mat-spinner>` | Vòng xoay tải | `mode="determinate\|indeterminate"`, `[value]`, `diameter` |
| **Progress bar** | `<mat-progress-bar>` | Thanh tiến trình | `mode="determinate\|indeterminate\|buffer\|query"`, `[value]` |
| **Ripple** | `matRipple` | Hiệu ứng gợn khi chạm | `matRippleColor`, `matRippleCentered` (chủ yếu tô hiệu ứng) |

> **Mockup note:** chọn **một bộ button variant** chủ đạo (vd filled cho primary, outlined cho secondary, icon-button cho thao tác trên bảng) và dùng nhất quán. FAB chỉ cho hành động chính nổi bật.

## 5. Popups & Modals

| Component | API | Purpose & mockup use | Key variants / inputs |
|---|---|---|---|
| **Dialog** | `MatDialog.open()` | Hộp thoại modal (form, xác nhận, chi tiết) | `MatDialogConfig` (`width`, `data`, `disableClose`), `mat-dialog-title/content/actions` |
| **Bottom sheet** | `MatBottomSheet.open()` | Bảng trượt từ đáy (mobile action list) | config `data`, `<component>` nội dung |
| **Snackbar** | `MatSnackBar.open()` | Thông báo ngắn dưới đáy (toast) | `duration`, action button, `panelClass`, position |
| **Tooltip** | `matTooltip` | Chú thích khi hover/focus | `matTooltipPosition`, `matTooltipShowDelay` |

> **Mockup note:** phân biệt rõ: xác nhận xóa → **Dialog**; báo thành công/lỗi tạm thời → **Snackbar**; menu thao tác trên mobile → **Bottom sheet**; giải thích icon → **Tooltip**.

## 6. Data table

| Component | Selector | Purpose & mockup use | Key variants / inputs |
|---|---|---|---|
| **Table** | `<table mat-table>` / `cdk-table` | Bảng dữ liệu | `[dataSource]`, `matColumnDef`, header/row/footer def, sticky columns/header, expandable rows |
| **Sort header** | `matSort` + `mat-sort-header` | Sắp xếp cột | `matSortActive`, `matSortDirection`, `(matSortChange)` |
| **Paginator** | `<mat-paginator>` | Phân trang | `length`, `pageSize`, `pageSizeOptions`, `(page)` |

> **Mockup note (gắn với feature CRUD `gen-feature`):** bảng danh sách = `mat-table` + `matSort` + `mat-paginator`; cột "Thao tác" dùng icon-button + `mat-menu` (theo rule trong agent `02-sa`).

---

## UI need → Material component (tra nhanh cho người dựng mockup)

| Cần gì | Dùng component |
|---|---|
| Nhập text/số | `mat-form-field` + `matInput` |
| Chọn từ danh sách | `mat-select` (it option) / `mat-autocomplete` (nhiều, có search) |
| Bật/tắt 1 thiết lập | `mat-slide-toggle` |
| Chọn nhiều mục | `mat-checkbox` / `mat-selection-list` / `mat-chip-listbox` |
| Chọn 1 trong vài | `mat-radio-group` / `mat-button-toggle-group` |
| Chọn ngày | `mat-datepicker` (range = date-range-input) |
| Bảng dữ liệu có sort/trang | `mat-table` + `matSort` + `mat-paginator` |
| Form nhiều bước | `mat-stepper` |
| Nhóm nội dung gọn | `mat-card` / `mat-expansion-panel` / `mat-tab-group` |
| Hành động trên dòng/bảng | `matIconButton` + `mat-menu` |
| Xác nhận / form popup | `MatDialog` |
| Thông báo tạm thời | `MatSnackBar` |
| Điều hướng app | `mat-toolbar` + `mat-sidenav` + `mat-nav-list` |
| Trạng thái tải | `mat-progress-bar` / `mat-progress-spinner` |
| Nhãn trạng thái | `mat-chip` (hiển thị) / `matBadge` (số) |

## Quy ước nhất quán cho mockup (visual fidelity)

- **Theming Material 3:** chốt 1 palette (primary/secondary/tertiary) + light/dark; ghi vào design-system (`ba/process/srs/08-design-system.md`).
- **Density:** chọn 1 mức density (0 / -1 / -2) cho toàn app (bảng dày đặc thường dùng -1).
- **Typography:** dùng scale typography của Material (`mat.typography`), không tự đặt size rời rạc.
- **Spacing/grid:** 8px baseline; layout qua `mat-grid-list` hoặc CDK Layout.
- **Icon:** dùng Material Symbols nhất quán (không trộn nhiều bộ icon).

> **Nguyên tắc (§0):** mockup chỉ map element sang component **có thật** trong catalog này; nếu thiết kế nguồn (Figma/SRS) cần thứ Material không có sẵn → ghi `(cần bổ sung / custom)` + flag cho con người, không tự bịa component.

---

## 7. Angular CDK — behavior primitives (cho mockup phức tạp)

CDK = hành vi/tương tác **không kèm style** (headless). Khi mockup cần hành vi vượt component Material sẵn có, map sang CDK dưới đây (DEV dùng trực tiếp hoặc tự style). Docs: `https://material.angular.dev/cdk/<name>`.

| CDK | API | Dùng trong mockup khi |
|---|---|---|
| **Drag & Drop** | `cdkDrag`, `cdkDropList`, `cdkDropListGroup` | Kéo-thả sắp xếp danh sách, bảng kanban, reorder hàng/cột |
| **Virtual Scroll** | `<cdk-virtual-scroll-viewport>`, `*cdkVirtualFor` | Danh sách/bảng RẤT dài (hàng nghìn dòng) — chỉ render phần nhìn thấy |
| **Layout (responsive)** | `BreakpointObserver`, `MediaMatcher` | Bố cục đáp ứng: đổi layout theo breakpoint (mobile/tablet/desktop) |
| **Overlay** | `Overlay`, `cdkConnectedOverlay` | Popup/panel tùy biến gắn theo vị trí (custom dropdown, popover) khi `mat-menu`/`mat-dialog` không đủ |
| **Portal** | `cdkPortal`, `cdkPortalOutlet` | Render nội dung động vào vị trí khác (toolbar động, slot) |
| **Text field** | `cdkTextareaAutosize`, `cdkAutofill` | Textarea tự giãn theo nội dung; phát hiện autofill |
| **Clipboard** | `cdkCopyToClipboard` | Nút "Copy" giá trị |
| **Scrolling** | `cdkScrollable`, `ScrollDispatcher` | Theo dõi scroll (sticky, lazy-load khi cuộn) |
| **A11y** | `cdkTrapFocus` (FocusTrap), `LiveAnnouncer`, `FocusMonitor` | Bẫy focus trong dialog, thông báo cho screen reader, quản lý focus bàn phím |
| **Bidi** | `Directionality`, `dir` | Hỗ trợ RTL/LTR |

**Headless primitives (unstyled — tự style theo Figma):** `cdkMenu`, `cdkListbox`, `cdkDialog`, `cdkTree`, `cdkStepper`, `cdkAccordion`, `cdkTable`, `cdkComboboxautocomplete` — nền tảng dựng component tùy biến khi bản Material styled không khớp thiết kế.

**Testing:** Component Harnesses — agent `07-qa` dùng để test tương tác component (không phải yếu tố mockup).

> **Mockup note:** phần lớn CDK là **hành vi**, không vẽ ra UI riêng. Trong mockup chỉ cần **ghi chú hành vi** (vd "kéo-thả sắp xếp", "cuộn ảo cho danh sách dài", "đổi layout ở breakpoint tablet") để DEV map sang CDK tương ứng — không cần vẽ thêm element.

---
*Danh mục 6 nhóm xác minh từ material.angular.dev 2026-06-03. API chi tiết từng component: mở `https://material.angular.dev/components/<tên>`. Ngoài ra Angular CDK cung cấp behavior primitives (Overlay, Drag&Drop, Layout, A11y…) — xem `material.angular.dev/cdk`.*
