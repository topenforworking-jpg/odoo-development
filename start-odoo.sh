#!/bin/bash

# =============================================
# 🚀 LANCEUR ODOO - Agh Data Agency
# =============================================

echo ""
echo "🌈  Démarrage d'Odoo..."
echo "========================================"

# Vérifier que nous sommes dans le bon environnement
if [ ! -f "/opt/odoo/odoo/odoo-bin" ]; then
    echo "❌ Erreur: Odoo non trouvé dans /opt/odoo/odoo/"
    echo "📍 Placez-vous dans le bon répertoire"
    exit 1
fi

# Aller dans le dossier Odoo
cd /opt/odoo/odoo

# Activer l'environnement virtuel
echo "🐍 Activation de l'environnement Python..."
source ../venv/bin/activate

# Vérifier l'adresse Tor
ONION_FILE="/var/lib/tor/odoo_service/hostname"
if [ -f "$ONION_FILE" ]; then
    ONION_URL=$(cat "$ONION_FILE")
    echo ""
    echo "🌐 ADRESSE ODOO VIA TOR:"
    echo "   http://${ONION_URL}/web/login"
    echo ""
fi

echo "💻 ADRESSE LOCALE:"
echo "   http://localhost:8069/web/login"
echo ""
echo "🔧 Identifiant admin: boulkassoum2002@gmail.com"
echo ""
echo "Mot de passe admin : sEd7@^-aPN3AC^u"
echo "🛑 Pour arrêter: Ctrl+C"
echo "========================================"
echo ""

# Lancer Odoo
exec python3 odoo-bin -c /etc/odoo.conf
