<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="{{route('admin.index')}}" class="brand-link">
        <img src="{{ asset ('dist/img/AdminLTELogo.png') }}" alt="Admin Panel" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Admin Panel</span>
    </a>
    <div class="sidebar">
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header">MAIN</li>
                <x-admin.nav-link href="{{ route('languages.index') }}" icon="fas fa-language" title="Languages" />
                <li class="nav-header">PAGES</li>
                <x-admin.nav-link href="{{ route('categories.index') }}" icon="fas fa-list" title="Categories" />
                <x-admin.nav-link href="{{ route('pages.index') }}" icon="fab fa-page4" title="Pages" />
                <x-admin.nav-link href="{{ route('blocks.index') }}" icon="fas fa-th" title="General Blocks" />

                <li class="nav-header">MENU</li>
                <x-admin.nav-link href="{{ route('menus.index') }}" icon="fas fa-ellipsis-v" title="Menus" />
                <li class="nav-header">SYSTEM</li>
                <x-admin.nav-link href="{{ route('templates.index') }}" icon="fas fa-code" title="Templates" />
                <x-admin.nav-link href="{{ route('backups.index') }}" icon="fas fa-download" title="Backups" />
                <x-admin.nav-link href="{{ route('events.index') }}" icon="fas fa-history" title="History" />
                <x-admin.nav-link href="/admin/docs" icon="fas fa-question" title="Docs" />
            </ul>
        </nav>
    </div>
</aside>

