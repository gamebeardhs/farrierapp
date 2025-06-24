import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:drift/drift.dart' hide Column;
import '../data/database.dart'; // Visit
import '../data/visits_dao.dart'; // VisitsDao

class EditVisitDialog extends StatefulWidget {
  final Visit visit;
  final VisitsDao visitsDao;

  const EditVisitDialog({
    super.key,
    required this.visit,
    required this.visitsDao,
  });

  @override
  State<EditVisitDialog> createState() => _EditVisitDialogState();
}

class _EditVisitDialogState extends State<EditVisitDialog> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _selectedDateTime;
  late String _type;
  String? _notes;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.visit.date;
    _type = widget.visit.type;
    _notes = widget.visit.notes;
  }

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _selectedDateTime.hour,
          _selectedDateTime.minute,
        );
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );
    if (picked != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final updated = widget.visit.copyWith(
      date: _selectedDateTime,
      type: _type,
      notes: Value(_notes),
    );
    await widget.visitsDao.updateVisit(updated);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Visit'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Date: ${DateFormat.yMd().format(_selectedDateTime)}'),
              trailing: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _pickDate(context),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Time: ${DateFormat.Hm().format(_selectedDateTime)}'),
              trailing: IconButton(
                icon: const Icon(Icons.access_time),
                onPressed: () => _pickTime(context),
              ),
            ),
            DropdownButtonFormField<String>(
              value: _type,
              items: ['trim', 'shoe', 'other']
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) => setState(() => _type = value ?? 'trim'),
              decoration: const InputDecoration(labelText: 'Type'),
            ),
            TextFormField(
              initialValue: _notes,
              decoration: const InputDecoration(labelText: 'Notes (optional)'),
              onSaved: (val) => _notes = val?.isEmpty ?? true ? null : val,
              maxLines: 2,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
